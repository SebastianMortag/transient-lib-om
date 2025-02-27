﻿within TransiEnt.Basics.Functions.GasProperties;
function L_idealGas "Calculates mass of air required for combustion with a given lamba"




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
  import TransiEnt;

  // _____________________________________________
  //
  //           Input/Output variables
  // _____________________________________________

  input TILMedia.GasTypes.BaseGas FuelMedium "fuel medium record used";
  input Real lambda "air ratio";
  input Modelica.Units.SI.MassFraction[:] xi_in "composition of fuel as massfraction";
  output Real L "massflowrate of air required for combustion of given fuel at given lambda";

  // _____________________________________________
  //
  //            Constants Parameters
  // _____________________________________________

protected
  parameter String[ncF] CompsF=TransiEnt.Basics.Functions.GasProperties.shortenCompName(FuelMedium.gasNames) "Component names in fuel gas";
  parameter Integer ncF = FuelMedium.nc_propertyCalculation "Number of components in fuel gas";
  parameter TransiEnt.Basics.Records.GasProperties.OxygenDemand OxygenDemand "record containing Oxygen demand for full conversion of elements";

  Modelica.Units.SI.MolarMass M_F[ncF] "molar masses of the fuels components";
  Modelica.Units.SI.AmountOfSubstance[ncF] n_dot_F "molar flowrate of components in fuelport per kg fuelstream";
  Modelica.Units.SI.AmountOfSubstance[5] n_flow_elements "molar flowrate of elements per kilogram fuel stream";
  Modelica.Units.SI.AmountOfSubstance[5] omin "minimum Oxygen demand for lambda=1. vector only for connection purposes";
  Modelica.Units.SI.MassFraction[ncF] xi;

algorithm
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

  // calculate full size mass fraction vector (nc components)
  if size(xi_in, 1)>1 then
    for i in 1:size(xi_in, 1)-1 loop
      xi[i] :=xi_in[i];
    end for;
    xi[end] :=1 - sum(xi_in);
  else
    xi[1] := 1;
  end if;

  //get molar masses of fuel's components
  for i in 1:ncF loop
     M_F[i] :=TILMedia.GasFunctions.molarMass_n(FuelMedium,i - 1);
  end for;

  //calculate moleflowrates in fuelport
  for i in 1:ncF loop
     n_dot_F[i] :=xi[i]/M_F[i];
  end for;

  //calculate flowrate of elements
  n_flow_elements :=TransiEnt.Basics.Functions.GasProperties.molarFlowRateElements(CompsF, n_dot_F);

  //calculate Oxygen demand
  omin :=OxygenDemand.omins*n_flow_elements;

  //convert molar Oxygen demand into airmass (air composition: 21 mol-% Oxygen / 79 mol-% Nitrogen)
  L :=sum(omin) * 0.02884 / 2;

  annotation (Documentation(info="<html>
<h4>Information</h4>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This function is used to convert a molar flow rate of fuel components into a molar flowrate of the elements the components consist of, adding the air that is needed for combustion at given <img src=\"modelica://TransiEnt/Images/equations/equation-UoL6DxB3.png\"/></p>
<p><img src=\"modelica://TransiEnt/Images/L_gas.png\"/></p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>No physical effects considered. </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks), just input and output vectors </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>No governing equations, this function mainly calls the function &QUOT;MolarFlowRateElements&QUOT; and adds the amount of air, calculated as may be seen in record &QUOT;OxygenDemand&QUOT;.</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>If there are components in your fuelgas which don&apos;t have a corresponding entry in the stoichiometric coefficients record, they will just be ignored, giving a faulty elements flowrate.</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Jan Braune (jan.braune@tu-harburg.de), Mar 2015</p>
<p>Revised by Lisa Andresen (andresen@tuhh.de), Dec 2015</p>
</html>"));
end L_idealGas;
