﻿within TransiEnt.Storage.Heat.HotWaterStorage_constProp_L4.Base;
model Diffusion "Second order 1D finite difference approximation of heat diffusion"
  // Model is bases on the model "Bouyancy in the "Buildings-library (https://github.com/lbl-srg/modelica-buildings.git)"




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
  //             Parameters
  // _____________________________________________

  parameter SI.Area A=1 "cross section area of control volume";
  parameter Integer N_cv=100 "Number of control volumes";
  parameter SI.Length dx = 0.01 "Heigth of control volume";
  parameter SI.ThermalConductivity k = 0.6 "Thermal conductivity of fluid in storage";

  final parameter Real G_diff = A*k/dx;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[N_cv] heatPort "Heat input into the volumes" annotation (Placement(transformation(extent={{-112,-6},{-92,14}}), iconTransformation(extent={{-112,-6},{-92,14}})));

equation
  // heat diffusion bottom element (first order approximation)
  heatPort[1].Q_flow = - G_diff * (heatPort[2].T-heatPort[1].T);

  // Heat diffusion for in between segments (second order approximation)
  for i in 2:N_cv-1 loop
    heatPort[i].Q_flow = - G_diff*(heatPort[i+1].T-2*heatPort[i].T+heatPort[i-1].T);
  end for;

  // heat diffusion top element (first order approximation)
  heatPort[N_cv].Q_flow = - G_diff * (heatPort[N_cv-1].T-heatPort[N_cv].T);

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Simple thermal diffusion modeled as energy source using heat port interfaces. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>Finite difference approximation of second order (error decreases with square of dx)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>You shouldnt use this if the model is not fit for a 1 dimensional discretization!</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>heatPort[N_cv]: Gets the temperatures from the temperature layers and returns the heat flow due to thermal diffusion</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>The input parameters</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>This model is largely based on the model &quot;Bouyancy&quot; in the Modelica Buildings-library (https://github.com/lbl-srg/modelica-buildings.git)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by <span style=\"font-family: MS Shell Dlg 2;\">Pascal Dubucq (dubucq@tuhh.de) on Wed August 24 2016. </span></p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(
          extent={{-68,-20},{78,-70}},
          lineColor={0,0,0},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-68,30},{78,-20}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-68,80},{78,30}},
          lineColor={0,0,0},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{2,22},{-14,22},{-14,-28},{-24,-28},{2,-54},{28,-28},{18,-28},{18,22},{2,22}},
          fillColor={0,0,0},
          fillPattern=FillPattern.CrossDiag,
          pattern=LinePattern.None),
        Polygon(
          points={{2,-12},{18,-12},{18,38},{28,38},{2,64},{-24,38},{-14,38},{-14,-12},{2,-12}},
          fillColor={0,0,0},
          fillPattern=FillPattern.CrossDiag,
          pattern=LinePattern.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
            graphics));
end Diffusion;
