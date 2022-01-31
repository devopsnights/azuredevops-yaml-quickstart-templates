@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'Example.Module.psm1'

    # Version number of this module.
    ModuleVersion     = '$(version)'

    # ID used to uniquely identify this module
    GUID              = 'aed4a85e-8550-4d44-97ac-bf01aa8a0ba8'

    # Author of this module
    Author            = 'Wesley'

    # Company or vendor of this module
    CompanyName       = 'Unknown'

    # Copyright statement for this module
    Copyright         = '(c) Wesley. All rights reserved.'

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules     = @('Example.Module.psm1')

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('*')

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @()
}

