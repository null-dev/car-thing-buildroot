################################################################################
#
# rustc
#
################################################################################

RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))

ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
$(info $$RUSTC_TARGET_NAME is $(RUSTC_TARGET_NAME))
$(info Setting CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc)
#$(foreach v, $(.VARIABLES), $(info $(v) = $($(v))))
endif

ifeq ($(HOSTARCH),riscv64)
RUSTC_HOST_ARCH = riscv64gc
else ifeq ($(HOSTARCH),x86)
RUSTC_HOST_ARCH = i686
else
RUSTC_HOST_ARCH = $(HOSTARCH)
endif

RUSTC_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu

$(eval $(host-virtual-package))
