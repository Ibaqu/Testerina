#!/bin/bash
#set -e

(cd Assertions ; eval $1)
(cd Data_Driven ; eval $1)
(cd Function_Mocking ; eval $1)
(cd Guaranteed_Execution_Order ; eval $1)
(cd Before_And_After ; eval $1)
(cd Grouping ; eval $1)
(cd Distribution_Object-Mocking ; eval $1)
(cd Object_Mocking ; eval $1)
#Guide tests
(cd Guide_Function_Mocking ; eval $1)
(cd Guide_Object_Mocking ; eval $1)
(cd Guide_QuickStart; eval $1)
(cd Guide_WritingTests ; eval $1)
