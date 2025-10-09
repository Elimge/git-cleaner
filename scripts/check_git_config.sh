#!/bin/bash

# Verificar si 'user.name' está configurado globalmente
if git config --global user.name &>/dev/null; then
	echo "Eliminando configuración global de user.name"
	git config --global --unset user.name
else
	echo "No hay configuración global de user.name"
fi

# Verificar si 'user.email' está configurado globalmente
if git config --global user.email &>/dev/null; then
	echo "Eliminando configuración global de user.email"
	git config --global --unset user.email
else
	echo "No hay configuración global de user.email"
fi
