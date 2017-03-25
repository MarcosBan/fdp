#!/bin/bash

		VAR=1	
		echo "Digite um numero:"
		read numa
		while (($VAR != 0)); do
		echo "Digite um numero:"
		read VAR
			if (($VAR !=0)); then
				(($VAR < $numa)) && numa=$VAR
			fi
		done
		echo "O menor valor foi $numa"
		read YYY
