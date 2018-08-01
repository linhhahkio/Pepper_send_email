<?xml version="1.0" encoding="UTF-8" ?>
<Package name="process_modify" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="behavior_1" xar="behavior.xar" />
        <BehaviorDescription name="behavior" src="." xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="Confirm" src="Confirm/Confirm.dlg" />
    </Dialogs>
    <Resources />
    <Topics>
        <Topic name="Confirm_fif" src="Confirm/Confirm_fif.top" topicName="Confirm" language="fi_FI" />
    </Topics>
    <IgnoredPaths />
    <Translations auto-fill="en_US">
        <Translation name="translation_en_US" src="translations/translation_en_US.ts" language="en_US" />
    </Translations>
</Package>
