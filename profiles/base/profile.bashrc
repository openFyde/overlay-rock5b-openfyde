rock5b_openfyde_stack_bashrc() {
  local cfg

  cfgd="/mnt/host/source/src/overlays/overlay-rock5b-openfyde/${CATEGORY}/${PN}"
  for cfg in ${PN} ${P} ${PF} ; do
    cfg="${cfgd}/${cfg}.bashrc"
    [[ -f ${cfg} ]] && . "${cfg}"
  done

  export ROCK5B_OPENFYDE_BASHRC_FILEPATH="${cfgd}/files"
}

rock5b_openfyde_stack_bashrc
