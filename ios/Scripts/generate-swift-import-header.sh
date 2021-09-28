#!/bin/sh

[[ "${PACKAGE_TYPE}" = "com.apple.package-type.wrapper.framework" ]] \
    && SWIFTIMPORT="<${PRODUCT_MODULE_NAME}/${PRODUCT_MODULE_NAME}-Swift.h>" \
    || SWIFTIMPORT="\"${PRODUCT_MODULE_NAME}-Swift.h\""

if [ -z "$PODS_TARGET_SRCROOT" ]; then
    PODS_TARGET_SRCROOT=${SOURCE_ROOT}
    echo "Building in Xcode instead of CocoaPods. Overriding PODS_TARGET_SRCROOT with SOURCE_ROOT"
fi

_Import_text="
#ifndef GeneratedSwiftImport_h
#define GeneratedSwiftImport_h

#import ${SWIFTIMPORT}

#endif /* GeneratedSwiftImport_h */
"
echo "$_Import_text" > ${PODS_TARGET_SRCROOT}/Classes/GeneratedSwiftImport.h

