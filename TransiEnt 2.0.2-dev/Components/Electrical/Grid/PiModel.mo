﻿within TransiEnt.Components.Electrical.Grid;
model PiModel "pi-Modell of a cable"




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






  extends TransiEnt.Basics.Icons.Model;

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

protected
  parameter TransiEnt.Basics.Units.SpecificResistance r=CableData[1];
  parameter TransiEnt.Basics.Units.SpecificReactance x=CableData[2];
  parameter TransiEnt.Basics.Units.SpecificCapacitance c=CableData[3];
  parameter Real CableData[4]=Base.getLVCableData(CableType) "saves the cabledata of the selected cable";
  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

public
  parameter Electrical.Grid.Characteristics.LVCabletypes CableType=Electrical.Grid.Characteristics.LVCabletypes.K1 "type of low voltage cable"
                                annotation (
    Evaluate=true,
    HideResult=true,
    Dialog(group="cable properties"));
  parameter SI.Length l = 1 "Cable Length" annotation(Evaluate=true, Dialog(group = "cable properties"));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp_p annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp_n annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

protected
  TransiEnt.Components.Electrical.Grid.Components.Reactance Reactance(final l=l, final x=x) annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  TransiEnt.Components.Electrical.Grid.Components.Resistor Resistor(final l=l, final r=r) annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
  TransiEnt.Components.Electrical.Grid.Components.Capacitor Capacitor1(final l=l, final c=c/2) annotation (Placement(transformation(extent={{-70,-32},{-50,-12}})));
  TransiEnt.Components.Electrical.Grid.Components.Capacitor Capacitor2(final l=l, final c=c/2) annotation (Placement(transformation(extent={{50,-34},{70,-14}})));

equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(Resistor.epp_p, epp_p) annotation (Line(
      points={{-38,0},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Resistor.epp_n, Reactance.epp_p) annotation (Line(
      points={{-18,0},{16,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Reactance.epp_n, epp_n) annotation (Line(
      points={{36,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Capacitor1.epp_p, epp_p) annotation (Line(
      points={{-60,-12},{-60,0},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Capacitor2.epp_p, epp_n) annotation (Line(
      points={{60,-14},{60,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics={  Line(points = {{-100,0},{100,0}}, color = {0,0,0}, smooth = Smooth.None),Rectangle(extent = {{-80,6},{80,-6}}, lineColor = {0,0,0}, fillColor = {0,0,0},
            fillPattern =                                                                                                   FillPattern.Solid),Text(extent = {{-100,-16},{100,-52}}, lineColor = {0,0,0}, fillColor = {0,0,255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "L = %l m"),Text(extent={{
              -144,56},{156,16}},                                                                                                    lineColor=
              {0,0,0},
          textString="%CableType"),
        Text(
          extent={{-202,94},{196,56}},
          lineColor={0,0,0},
          textString="%name")}),defaultComponentName = "Cable",
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Advanced line model using Transient electrical interfaces. Computes losses and voltage drop dependent of typical cable types and specified length.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">L3E (defined in the CodingConventions) - multiple phase, active and reactive power, voltage and frequency. </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>Apparent power port epp_p</p>
<p>Apparent power port epp_n</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>Tested in check model &quot;TransiEnt.Components.Electrical.Grid.Check.TestPiModel&quot;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Patrick Göttsch and revised by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end PiModel;
