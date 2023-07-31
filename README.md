# `dumpasn1` - display and debug ASN.1 data

> [!NOTE]\
> Copyright Peter Gutmann (<pgut001@cs.auckland.ac.nz>)

This is a mirror of Peter Gutmann's `dumpasn1`, adding versioning of both code and config
and automated updates from upstream.

## About

`dumpasn1` is an ASN.1 object dump program that will dump data encoded using any of the ASN.1 encoding
rules in a variety of user-specified formats. Sample output from this program (using the default format) is:

```
 256  159: SEQUENCE {
 259   13:   SEQUENCE {
 261    9:     OBJECT IDENTIFIER rsaEncryption (1 2 840 113549 1 1 1)
 272    0:     NULL
         :     }
 274  141:   BIT STRING, encapsulates {
 278  137:     SEQUENCE {
 281  129:       INTEGER
         :         00 E5 19 BF 6D A3 56 61 2D 99 48 71 F6 67 DE B9
[...]    :         8F
 413    3:       INTEGER 65537
         :       }
         :     }
         :   }
```

## Usage

```
DumpASN1 - ASN.1 object dump/syntax check program.
Copyright Peter Gutmann 1997 - 2021.  Last updated 22 April 2021.

Usage: dumpasn1 [-acdefghilmopqrstuvwxz] <file>
  Input options:
       - = Take input from stdin (some display options will be disabled)
       -q = Disable warning about stdin use affecting display options
       -<number> = Start <number> bytes into the file
       -- = End of arg list
       -c<file> = Read Object Identifier info from alternate config file
            (values will override equivalents in global config file)

  Output options:
       -f<file> = Dump object at offset -<number> to file (allows data to be
            extracted from encapsulating objects)
       -w<number> = Set width of output, default = 80 columns

  Display options:
       -a = Print all data in long data blocks, not just the first 128 bytes
       -d = Print dots to show column alignment
       -g = Display ASN.1 structure outline only (no primitive objects)
       -h = Hex dump object header (tag+length) before the decoded output
       -hh = Same as -h but display more of the object as hex data
       -i = Use shallow indenting, for deeply-nested objects
       -l = Long format, display extra info about Object Identifiers
       -m<number>  = Maximum nesting level for which to display content
       -p = Pure ASN.1 output without encoding information
       -t = Display text values next to hex dump of data
       -v = Verbose mode, equivalent to -ahlt

  Format options:
       -e = Don't print encapsulated data inside OCTET/BIT STRINGs
       -r = Print bits in BIT STRING as encoded in reverse order
       -u = Don't format UTCTime/GeneralizedTime string data
       -x = Display size and offset in hex not decimal

  Checking options:
       -o = Don't check validity of character strings hidden in octet strings
       -s = Syntax check only, don't dump ASN.1 structures
       -z = Allow zero-length items

Warnings generated by deprecated OIDs require the use of '-l' to be displayed.
Program return code is the number of errors found or EXIT_SUCCESS.
```

The expected input format is DER (binary). If your certificate is PEM encoded (with `—–BEGIN CERTIFICATE—–`),
you can convert it, e.g., with openssl:

```sh
openssl x509 -in cert.pem -inform PEM -out cert.der -outform DER
```

## Versioning

This code uses the date versioning available in the upstream code and adds Git tags and releases
accordingly. Upstream, source and config are versioned independent of each other. Whenever one or
the other is updated, this repo is tagged with the date version of format that is stated in
the source, and a new release is added. The version from the file, which has the format `YYYYMMDD`
is transformed into a semantic version of the form `vYYYYMMDD.%d.%d` (e.g., `v20230207.0.0`), where
the minor and patch versions are controlled by this repository. To further track the different versions
of config and code, additional tags are added specific to either code or config: `YYMMDD-c` for the
latest code version, and `YYYYMMDD-cfg` for the latest config version.

## License

For easier redistribution, the code is re-licensed with a BSD 2-Clause license, which should
be compatible to the original non-standard license you find in the header comment of the C source as well
as the config. Notice that the original license is more permissive than one the present in the LICENSE file of
this repository, so you can always follow the original license of the source if you prefer to.

## Related

- [**Peter Gutmann's website**](https://www.cs.auckland.ac.nz/~pgut001/#standards) has more information on `dumpasn1`,
     security standards and an X.509 style guide.
- [**ASN.1 online decoder**](http://lapo.it/asn1js/) provides a nice interface to debug your ASN.1 in browser.
