﻿within TransiEnt.Consumer.Systems.FridgePoolControl.Pool;
model UniqueFridge



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

  extends TransiEnt.Basics.Icons.Model;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Integer poolSize = 1000;
  parameter Integer poolIndex = 1;
  parameter Real alpha;
  parameter Real dbf;
  //final parameter Modelica.SIunits.Temp_K T0G_abh = T0K-25;

  parameter Real uniqueParams[poolSize,9]
    annotation(HideResult=true);
  parameter Boolean startStatus[poolSize]
   annotation(HideResult=true);

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Components.SmartFridgeFreezer fridgeFreezer(
    T_amb=uniqueParams[poolIndex, 1],
    T_fridge_start=uniqueParams[poolIndex, 4],
    cp_fridge=uniqueParams[poolIndex, 5],
    cp_freezer=uniqueParams[poolIndex, 6],
    k_fridge2ambient=uniqueParams[poolIndex, 7],
    m_fridge=uniqueParams[poolIndex, 8],
    COP=uniqueParams[poolIndex, 9],
    x_fridge=0.4688,
    thermostat(T_set=uniqueParams[poolIndex, 2],q0=startStatus[poolIndex],delta_f_db=dbf, alpha=alpha, delta=uniqueParams[poolIndex, 3]))
               annotation (Placement(transformation(extent={{-40,-32},{30,32}})));
  TransiEnt.Basics.Interfaces.Electrical.ActivePowerPort epp annotation (Placement(transformation(extent={{80,-10},{100,10}}), iconTransformation(extent={{80,-10},{100,10}})));

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(fridgeFreezer.epp, epp) annotation (Line(
      points={{30.35,-1.77636e-015},{57.25,-1.77636e-015},{57.25,0},{90,0}},
      color={0,135,135},
      thickness=0.5));

  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-50,56},{42,-60}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Line(points={{42,14},{32,14},{-50,14}}, color={0,0,0}),
        Rectangle(
          extent={{24,46},{30,22}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{24,6},{30,-50}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
                Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Full documentation is not available yet. Please see comments in code or contact author per mail.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) <span style=\"font-family: MS Shell Dlg 2;\">on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quality check (Code conventions) by Rebekka Denninger on 01.10.2016</span></p>
</html>"));
end UniqueFridge;
