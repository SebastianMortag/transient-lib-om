﻿within TransiEnt.Components.Turbogroups;
model ThreeStateTurbine "Generic model of a turbine with three states (halt / startup / running), pyhsical constraints (Pmin,Pmax,Pgradmax) no explicit plant dynamic modeled"




//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
//                                                                                //
// Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
// Copyright 2021, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
// supported by the German Federal Ministry of Economics and Energy               //
// (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
// Gas- und Wärme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//






  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends Base.PartialTurbine;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.Power P_n=2e9 "Nominal power";

  parameter Real P_min_star=0.3 "Dimensionless minimum power (=20% of nominal power)";

  parameter Real P_max_star=1 "Dimensionless maximum power (=Nominal power)";

  parameter Real P_grad_max_star=0.1/60 "Dimensionless maximum power gradient per second (12% of P_nom per minute)";

  parameter Real Td=1e-3 "The higher Nd, the closer y follows u"
                                            annotation(Dialog(group="Numerical"));
  parameter Boolean useThresh=false "Use threshould for suppression of numerical noise"
                                                         annotation(Dialog(group="Numerical"));
  parameter Real thres=1e-7 "If abs(u-y)< thres, y becomes a simple pass through of u. Increasing thres can improve simulation speed. However to large values can make the simulation unstable. 
     A good starting point is the choice thres = tolerance/1000."  annotation(Dialog(group="Numerical"));

  parameter Real P_turb_init=0 "Initial or guess value of turbine power (in p.u.)";

  parameter SI.Time T_plant=10 "Turbine first order dynamic";

  parameter SI.Time t_startup=360 "Startup time (no output during startup)";

  //parameter SI.Time t_shutdown=60 "Time it takes to disconnect from grid (P=P_set during shutdown)";

  parameter Real thres_hyst=1e-10 "Threshold for hysteresis for switch from halt to startup (chattering might occur, hysteresis might help avoiding this)" annotation(Dialog(group="Numerical"));

  parameter SI.Time t_eps=10 "Threshold time for transitions" annotation(Dialog(group="Numerical"));

  parameter Boolean useSlewRateLimiter=true "choose if slewRateLimiter is activated";

  outer SimCenter simCenter;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.BooleanOutput isGeneratorRunning annotation (
      Placement(transformation(rotation=0, extent={{100,10},{120,30}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_spinning_set "Setpoint for spinning reserve power"
                                                      annotation (Placement(transformation(
        rotation=270,
        extent={{-12,-12},{12,12}},
        origin={36,98})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Math.Gain normalize(k=1/P_n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,54})));
  Basics.Blocks.SwitchNoEvent switchOnOff annotation (Placement(transformation(extent={{-32,-70},{-12,-50}})));

  Modelica.Blocks.Sources.Constant shutdown(k=0)
    annotation (Placement(transformation(extent={{-64,-94},{-44,-74}})));
  Modelica.Blocks.Math.Gain normalizePbal(k=1/P_n) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={36,52})));

  Modelica.Blocks.Math.MultiSum P_setpoint_total(nu=2) annotation (Placement(transformation(
        extent={{-6.5,-6},{6.5,6}},
        rotation=0,
        origin={-10.5,-14})));
  Modelica.Blocks.Math.Gain deNormalize(k=P_n) annotation (Placement(transformation(extent={{60,-66},{72,-54}})));
  Boundaries.Mechanical.Power MechanicalBoundary annotation (Placement(transformation(extent={{70,-84},{88,-66}})));
  Modelica.Blocks.Nonlinear.Limiter P_max_star_limiter_total(uMax=0, uMin=-
        operationStatus.P_max_operating) "Upper limit is nominal power"
    annotation (Placement(transformation(extent={{2,-70},{22,-50}})));

  // _____________________________________________
  //
  //           Diagnostic Variables
  // _____________________________________________

  Real P_set_star = normalize.y;
  Real P_is_star = deNormalize.u;
  replaceable OperatingStates.ThreeStateDynamic operationStatus(
    useSlewRateLimiter=useSlewRateLimiter,
    t_startup=t_startup,
    P_star_init=P_turb_init/P_n,
    P_min_operating=P_min_star,
    P_max_operating=P_max_star,
    P_grad_operating=P_grad_max_star,
    thres_hyst=thres_hyst,
    thres=thres,
    useThresh=useThresh,
    P_grad_inf=P_grad_max_star,
    Td=Td,
    t_eps=t_eps) constrainedby TransiEnt.Components.Turbogroups.OperatingStates.PartialStateDynamic "Operating State Model" annotation (choicesAllMatching=true, Placement(transformation(extent={{-52,-22},{-32,-2}})));
  Modelica.Blocks.Sources.BooleanExpression isOperating(y=operationStatus.isOperating)     annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(MechanicalBoundary.mpp, mpp) annotation (Line(
      points={{88,-75},{88,-2},{100,-2}},
      color={95,95,95},
      smooth=Smooth.None));
  connect(P_target, normalize.u) annotation (Line(
      points={{0,98},{0,66},{2.22045e-015,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(deNormalize.y, MechanicalBoundary.P_mech_set) annotation (
      Line(
      points={{72.6,-60},{79,-60},{79,-64.38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P_spinning_set, normalizePbal.u) annotation (Line(
      points={{36,98},{36,60.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P_max_star_limiter_total.u, switchOnOff.y) annotation (Line(points={{0,-60},{0,-60},{-11,-60}},  color={0,0,127}));
  connect(normalize.y,operationStatus. P_set_star) annotation (Line(points={{-2.22045e-015,43},{-40,43},{-80,43},{-80,-12},{-52,-12}},
                                                                                                color={0,0,127}));
  connect(isOperating.y, switchOnOff.u2) annotation (Line(points={{-69,-60},{-34,-60}}, color={255,0,255}));
  connect(operationStatus.P_set_star_lim, P_setpoint_total.u[1]) annotation (Line(points={{-30.8,-12},{-28,-12},{-28,-11.9},{-17,-11.9}}, color={0,0,127}));
  connect(normalizePbal.y, P_setpoint_total.u[2]) annotation (Line(points={{36,44.3},{38,44.3},{38,34},{-16,34},{-24,34},{-24,-16.1},{-17,-16.1}}, color={0,0,127}));
  connect(isOperating.y, isGeneratorRunning) annotation (Line(points={{-69,-60},{-62,-60},{-62,20},{110,20}}, color={255,0,255}));
  connect(P_max_star_limiter_total.y, deNormalize.u) annotation (Line(points={{23,-60},{58.8,-60}},            color={0,0,127}));
  connect(P_setpoint_total.y, switchOnOff.u1) annotation (Line(points={{-2.895,-14},{0,-14},{0,-34},{-42,-34},{-42,-52},{-34,-52}}, color={0,0,127}));
  connect(switchOnOff.u3, shutdown.y) annotation (Line(points={{-34,-68},{-38,-68},{-38,-84},{-43,-84}}, color={0,0,127}));
  connect(operationStatus.P_actual_star, deNormalize.u) annotation (Line(points={{-42,-22},{-42,-28},{44,-28},{44,-60},{58.8,-60}}, color={0,127,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                          Icon(graphics={
    Polygon(visible=true,
          lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80,92},{-88,70},{-72,70},{-80,92}}),
      Line(visible=true,
            points={{-80,80},{-80,-88}},
          color={192,192,192}),
    Line(
      points={{-80,-80},{20,60}},
      color={0,0,0},
      smooth=Smooth.None),
    Line(visible=true,
          points={{-90,-78},{82,-78}},
        color={192,192,192}),
    Polygon(visible=true,
          lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90,-78},{68,-70},{68,-86},{90,-78}}),
        Line(
          points={{-50,-18},{-42,-24}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-70,-44},{-62,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-30,10},{-22,4}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-14,34},{-6,28}},
          color={0,0,0},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Turbine model modeled by </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- minimum / maximum power ouput</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- maximum power gradient</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- on / off status dependent on schedule value without time delay. Turbine shuts down if scheduled value is below minimum power</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- sends on/off status to momentum of inertia statistics </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Note, that no statistics are involved!</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">mpp: mechanical power port</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">P_target: input for electric power in W</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">P_spinning_set: input for electric power in W (setpoint for spinning reserve power)</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">isGeneratorRunning: BooleanOutput</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The input P_spinning_set is supposed to be gradient limited by limtations of the primary balancing offer mechanism which has normally a higher gradient limit than the rest of the plant.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The input P_target is the sum of secondary balancing setpoint and scheduled set point</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end ThreeStateTurbine;
