﻿within TransiEnt.Components.Sensors;
model ElectricReactivePower "Measure Frequency on ElectricPowerPort"




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

  extends TransiEnt.Basics.Icons.Sensor;

  // _____________________________________________
  //
  //          Parameters
  // _____________________________________________

  parameter Boolean change_of_sign = false;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp_IN annotation (Placement(transformation(extent={{-102,-10},{-82,10}}), iconTransformation(extent={{-102,-10},{-82,10}})));
  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp_OUT annotation (Placement(transformation(extent={{82,-10},{102,10}}), iconTransformation(extent={{84,-10},{104,10}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P "Active Power"
                                                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={34,74}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-38,78})));
  TransiEnt.Basics.Interfaces.Electrical.ReactivePowerOut Q "Reactive Power" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={34,74}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={34,78})));
equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________
  epp_IN.f = epp_OUT.f;
  epp_IN.v = epp_OUT.v;
  epp_IN.P + epp_OUT.P = 0;
  epp_IN.Q + epp_OUT.Q = 0;
  P = if change_of_sign then -epp_OUT.P else epp_OUT.P;
  Q = if change_of_sign then -epp_OUT.Q else epp_OUT.Q;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                               graphics={Text(
            extent={{-68,92},{-40,70}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="P"),             Text(
            extent={{4,92},{32,70}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
          textString="Q")}),   Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Measure active and reactive power on electric line using TransiEnt interfaces with L2E (single phase, active and reactive power, voltage and frequency)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>epp_in: apparent power port</p>
<p>epp_out: apparent power port</p>
<p>P: output for actve power in W</p>
<p>Q: output for reactive power in var</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p>Q is the reactive power</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end ElectricReactivePower;
