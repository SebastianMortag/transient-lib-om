﻿within TransiEnt.Components.Gas.Reactor.Check;
model TestMethanator_L4_m_flow_var



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






extends TransiEnt.Basics.Icons.Checkmodel;

  import      Modelica.Units.SI;

  parameter TransiEnt.Basics.Media.Gases.VLE_VDIWA_SG4_var vle_sg4;
  parameter TransiEnt.Basics.Media.Gases.Gas_VDIWA_SG4_var gas_sg4;

  parameter Integer N_cv=10;

  TransiEnt.Components.Gas.Reactor.Methanator_L4 methanator_L4(
    N_cv=N_cv,
    ScalingOfReactor=4,
    H_flow_n_Hydrogen=1*(1 - 0.844884)*119.95e6)
                        annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_pTxi boundaryRealGas_pTxi(medium=vle_sg4, p_const=2000000)
                                                                                                           annotation (Placement(transformation(extent={{94,-10},{74,10}})));
  TransiEnt.Components.Sensors.RealGas.CompositionSensor moleCompIn(medium=vle_sg4, compositionDefinedBy=2) annotation (Placement(transformation(extent={{-82,0},{-62,20}})));
  TransiEnt.Components.Sensors.RealGas.CompositionSensor moleCompOut(medium=vle_sg4, compositionDefinedBy=2) annotation (Placement(transformation(extent={{22,0},{42,20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature      prescribedTemperature[N_cv](each T=558.15)
                                                                                          annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-42,30})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=0.5e6,
    startTime=0.5e6,
    height=1,
    offset=-1)           annotation (Placement(transformation(extent={{-138,-4},{-118,16}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_Txim_flow    boundaryRealGas_Teps_nV_flow_n(
    medium=vle_sg4,
    variable_m_flow=true,
    xi_const={0,0.844884,0},
    T_const=558.15)  annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
  TransiEnt.Basics.Adapters.Gas.Ideal_to_Real ideal_to_Real(redeclare TransiEnt.Basics.Media.Gases.VLE_VDIWA_SG4_var real, redeclare TransiEnt.Basics.Media.Gases.Gas_VDIWA_SG4_var ideal) annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
  TransiEnt.Basics.Adapters.Gas.Real_to_Ideal real_to_Ideal(redeclare TransiEnt.Basics.Media.Gases.VLE_VDIWA_SG4_var real, redeclare TransiEnt.Basics.Media.Gases.Gas_VDIWA_SG4_var ideal) annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  Sensors.RealGas.CompositionSensorDryGas moleCompOutDry(medium=vle_sg4, compositionDefinedBy=2) annotation (Placement(transformation(extent={{48,0},{68,20}})));
equation
  connect(real_to_Ideal.gasPortOut, methanator_L4.gasPortIn) annotation (Line(
      points={{-36,0},{-30,0}},
      color={255,213,170},
      thickness=1.5));
  connect(methanator_L4.gasPortOut, ideal_to_Real.gasPortIn) annotation (Line(
      points={{-10,0},{-4,0}},
      color={255,213,170},
      thickness=1.5));
  connect(methanator_L4.heat, prescribedTemperature.port) annotation (Line(points={{-20,10},{-20,30},{-32,30}},
                                                                                                            color={191,0,0}));
  connect(boundaryRealGas_Teps_nV_flow_n.gasPort, moleCompIn.gasPortIn) annotation (Line(
      points={{-88,0},{-82,0}},
      color={255,255,0},
      thickness=1.5));
  connect(moleCompIn.gasPortOut, real_to_Ideal.gasPortIn) annotation (Line(
      points={{-62,0},{-56,0}},
      color={255,255,0},
      thickness=1.5));
  connect(ideal_to_Real.gasPortOut, moleCompOut.gasPortIn) annotation (Line(
      points={{16,0},{22,0}},
      color={255,255,0},
      thickness=1.5));
  connect(ramp.y, boundaryRealGas_Teps_nV_flow_n.m_flow) annotation (Line(points={{-117,6},{-110,6}},                   color={0,0,127}));
  connect(moleCompOut.gasPortOut, moleCompOutDry.gasPortIn) annotation (Line(
      points={{42,0},{48,0}},
      color={255,255,0},
      thickness=1.5));
  connect(boundaryRealGas_pTxi.gasPort, moleCompOutDry.gasPortOut) annotation (Line(
      points={{74,0},{68,0}},
      color={255,255,0},
      thickness=1.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{100,100}})),
    experiment(StopTime=1e+006, Tolerance=1e-006),
    __Dymola_experimentSetupOutput,
    Icon(graphics,
         coordinateSystem(extent={{-140,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for the Methanator_L4 model with a variable mass flow</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TestMethanator_L4_m_flow_var;
