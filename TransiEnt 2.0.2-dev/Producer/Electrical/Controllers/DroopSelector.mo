﻿within TransiEnt.Producer.Electrical.Controllers;
function DroopSelector "This function can be used to conveniently select a droop either by specifying a distinct value or by selecting a typical value depending on the plant type"



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

  extends TransiEnt.Basics.Icons.Function;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  input TransiEnt.Basics.Types.ControlPlantType plantType;
  input Real param;
  output Real droop;

protected
  // _____________________________________________
  //
  //                  Constants
  // _____________________________________________
  constant Real peakLoadPlant=2.5e-2 "2,5%";
  constant Real midLoadPlant=4e-2 "4%";
  constant Real baseLoadPlant=6e-2 "Base Load 6%";


algorithm
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________
  if plantType == TransiEnt.Basics.Types.ControlPlantType.PeakLoad then
    droop :=peakLoadPlant;
  elseif plantType == TransiEnt.Basics.Types.ControlPlantType.BaseLoad then
    droop := baseLoadPlant;
  elseif plantType == TransiEnt.Basics.Types.ControlPlantType.MidLoad then
    droop := midLoadPlant;
   else
    droop :=param;
  end if;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model selects the droop value depending on the plant type (peak-, base- or midload).</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Typical droop values of power plants taken from Schwab (2012) - Elektroenergiesysteme, Springer</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>(no remarks)</p>
</html>"));
end DroopSelector;
