﻿within TransiEnt.Storage.Electrical.Base;
model BatteryPowerLimit "Typically the maximum power limits of storages (both while loading and unloading) depends on the SOC"



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

  extends TransiEnt.Basics.Icons.Block;

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  replaceable Modelica.Blocks.Tables.CombiTable1Dv P_max_load_over_SOC(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    tableOnFile=false,
    table=[0,1; 0.01,1; 0.02,1; 0.03,1; 0.04,1; 0.05,1; 0.06,1; 0.07,1; 0.08,1; 0.09,1; 0.1,1; 0.11,1; 0.12,1; 0.13,1; 0.14,1; 0.15,1; 0.16,1; 0.17,1; 0.18,1; 0.19,1; 0.2,1; 0.21,1; 0.22,1; 0.23,1; 0.24,1; 0.25,1; 0.26,1; 0.27,1; 0.28,1; 0.29,1; 0.3,1; 0.31,1; 0.32,1; 0.33,1; 0.34,1; 0.35,1; 0.36,1; 0.37,1; 0.38,1; 0.39,1; 0.4,1; 0.41,1; 0.42,1; 0.43,1; 0.44,1; 0.45,0.998114352; 0.46,0.996685646; 0.47,0.994712346; 0.48,0.992191161; 0.49,0.989118773; 0.5,0.985491839; 0.51,0.981306986; 0.52,0.976560817; 0.53,0.971249905; 0.54,0.965370795; 0.55,0.958920006; 0.56,0.951894026; 0.57,0.944289315; 0.58,0.936102305; 0.59,0.927329398; 0.6,0.917966964; 0.61,0.908011347; 0.62,0.897458858; 0.63,0.886305777; 0.64,0.874548355; 0.65,0.862182811; 0.66,0.849205331; 0.67,0.835612071; 0.68,0.821399154; 0.69,0.806562671; 0.7,0.791098677; 0.71,0.775003198; 0.72,0.758272224; 0.73,0.740901711; 0.74,0.722887581; 0.75,0.704225722; 0.76,0.684911985; 0.77,0.664942187; 0.78,0.644312109; 0.79,0.623017495; 0.8,
        0.601054054; 0.81,0.578417455; 0.82,0.555103333; 0.83,0.531107283; 0.84,0.506424861; 0.85,0.481051587; 0.86,0.454982941; 0.87,0.428214361; 0.88,0.400741249; 0.89,0.372558963; 0.9,0.343662822; 0.91,0.314048104; 0.92,0.283710045; 0.93,0.252643838; 0.94,0.220844633; 0.95,0.188307539; 0.96,0.15502762; 0.97,0.120999894; 0.98,0.086219339; 0.99,0.050680883; 1,0; 1.0001,0],
    verboseRead=true) constrainedby Modelica.Blocks.Tables.CombiTable1Dv annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,26},{10,46}})));
  replaceable Modelica.Blocks.Tables.CombiTable1Dv P_max_unload_over_SOC(
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    tableOnFile=false,
    table=[-0.0001,0; 0,0; 1e-06,0; 0.01,0.035714286; 0.02,0.071428571; 0.03,0.107142857; 0.04,0.142857143; 0.05,0.178571429; 0.06,0.214285714; 0.07,0.25; 0.08,0.285714286; 0.09,0.321428571; 0.1,0.357142857; 0.11,0.392857143; 0.12,0.428571429; 0.13,0.464285714; 0.14,0.5; 0.15,0.535714286; 0.16,0.571428571; 0.17,0.607142857; 0.18,0.642857143; 0.19,0.678571429; 0.2,0.714285714; 0.21,0.75; 0.22,0.785714286; 0.23,0.821428571; 0.24,0.857142857; 0.25,0.892857143; 0.26,0.928571429; 0.27,0.964285714; 0.28,1; 0.29,1; 0.3,1; 0.31,1; 0.32,1; 0.33,1; 0.34,1; 0.35,1; 0.36,1; 0.37,1; 0.38,1; 0.39,1; 0.4,1; 0.41,1; 0.42,1; 0.43,1; 0.44,1; 0.45,1; 0.46,1; 0.47,1; 0.48,1; 0.49,1; 0.5,1; 0.51,1; 0.52,1; 0.53,1; 0.54,1; 0.55,1; 0.56,1; 0.57,1; 0.58,1; 0.59,1; 0.6,1; 0.61,1; 0.62,1; 0.63,1; 0.64,1; 0.65,1; 0.66,1; 0.67,1; 0.68,1; 0.69,1; 0.7,1; 0.71,1; 0.72,1; 0.73,1; 0.74,1; 0.75,1; 0.76,1; 0.77,1; 0.78,1; 0.79,1; 0.8,1; 0.81,1; 0.82,1; 0.83,1; 0.84,1; 0.85,1; 0.86,1; 0.87,1; 0.88,1; 0.89,1; 0.9,1; 0.91,
        1; 0.92,1; 0.93,1; 0.94,1; 0.95,1; 0.96,1; 0.97,1; 0.98,1; 0.99,1; 1,1]) constrainedby Modelica.Blocks.Tables.CombiTable1Dv annotation (choicesAllMatching=true, Placement(transformation(extent={{-8,-54},{12,-34}})));

  Modelica.Blocks.Interfaces.RealInput SOC "State of charge of storage (=E/Emax)"
    annotation (Placement(transformation(extent={{-124,-20},{-84,20}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_max_load_star "Maximum storage power when loading" annotation (Placement(transformation(extent={{92,16},{132,56}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_max_unload_star "Maximum storage power when unloading" annotation (Placement(transformation(extent={{94,-64},{134,-24}})));
equation
  // _____________________________________________
  //
  //           Connect statements
  // _____________________________________________

  connect(SOC,P_max_load_over_SOC. u[1]) annotation (Line(
      points={{-104,0},{-60,0},{-60,36},{-12,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SOC,P_max_unload_over_SOC. u[1]) annotation (Line(
      points={{-104,0},{-60,0},{-60,-44},{-10,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P_max_load_over_SOC.y[1], P_max_load_star) annotation (Line(points={{11,36},{112,36}}, color={0,0,127}));
  connect(P_max_unload_over_SOC.y[1], P_max_unload_star) annotation (Line(points={{13,-44},{56,-44},{98,-44},{114,-44}}, color={0,0,127}));
  connect(P_max_unload_star, P_max_unload_star) annotation (Line(points={{114,-44},{114,-44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
                           Text(
          extent={{28,30},{88,-30}},
          lineColor={0,0,0},
          textString=""),
  Line(points={{-88,-82},{84,-82}},
    color={192,192,192}),
  Polygon(lineColor={192,192,192},
    fillColor={192,192,192},
    fillPattern=FillPattern.Solid,
    points={{92,-82},{70,-74},{70,-90},{92,-82}}),
  Line(points={{-70,76},{-70,-92}},
    color={192,192,192}),
  Polygon(lineColor={192,192,192},
    fillColor={192,192,192},
    fillPattern=FillPattern.Solid,
    points={{-70,88},{-78,66},{-62,66},{-70,88}}),
        Line(
          points={{-70,64},{-38,64},{-10,62},{8,50},{26,32},{48,-26},{52,-58},{52,-82}},
          color={0,0,0},
          smooth=Smooth.Bezier)}),
                Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Typically the maximum power limits of storages (both while loading and unloading) depends on the SOC.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>SOC: RealInput- SOC: state of charge</p>
<p>P_max_load_star: output for electric power in [W]</p>
<p>P_max_unload_star: output for electric power in [W]</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>[1] Arne Dörschlag, &quot;Erbringung von Primärregelleistung durch Kleinbatteriespeicher im Poolverbund unter Berücksichtigung solarer Eigenstromoptimierung&quot;, M.S. thesis, Institute of Electric Power Systems and Automation, Hamburg of Technical University, Sep. 2014</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) <span style=\"font-family: MS Shell Dlg 2;\">on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quality check (Code conventions) by Rebekka Denninger on 01.10.2016</span></p>
</html>"));
end BatteryPowerLimit;
