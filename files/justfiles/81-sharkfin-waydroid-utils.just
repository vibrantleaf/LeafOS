# Run the Sharkfin Waydroid Setup Wizard
waydroid-setup-wizard:
    #!/usr/bin/env bash
    /usr/bin/waydroid-wizard

# Run Waydroid Wizard using the VANILLA system type (Advanced)
waydroid-setup-wizard-vanilla:
    #!/usr/bin/env bash
    system_type="VANILLA" /usr/bin/waydroid-wizard

# Run Waydroid Wizard using the GAPPS system type (Advanced)
waydroid-setup-wizard-gapps:
    #!/usr/bin/env bash
    system_type="GAPPS" /usr/bin/waydroid-wizard

# Run Waydroid Wizard using the FOSS system type (Advanced)
waydroid-setup-wizard-foss:
    #!/usr/bin/env bash
    system_type="FOSS" /usr/bin/waydroid-wizard

# Factory Reset Waydroid
waydroid-factory-reset:
    #!/usr/bin/env bash
    /usr/libexec/sharkfin-waydroid-utils-reset

# Force Stop Waydroid
waydroid-force-stop:
    #!/usr/bin/env bash
    /usr/libexec/sharkfin-waydroid-utils-stop
