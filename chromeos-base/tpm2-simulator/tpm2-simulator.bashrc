# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

cros_pre_src_prepare_rock5b_openfyde_patches() {
    eapply -p2 ${ROCK5B_OPENFYDE_BASHRC_FILEPATH}/skip-selinux_restorecon.patch
}
