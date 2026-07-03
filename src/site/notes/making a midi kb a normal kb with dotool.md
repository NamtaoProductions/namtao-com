---
{"dg-publish":true,"dg-path":"public/dotool-midi","permalink":"/public/dotool-midi/","hide":true,"tags":["midi","music","automation","linux","keyboard"],"noteIcon":"","updated":"2026-02-19T07:23:05.000+00:00","dg-note-properties":{"up":["[[Linux]]"],"tags":["midi","music","automation","linux","keyboard"],"created":"2025-01-07T17:27","updated":"2025-05-16T09:19"}}
---

## Find out the Names of Connected Midi Devices

```bash
aseqdump --list
```

## Find out the Codes for Your Device

```bash
aseqdump -p "Launchkey Mini MK3"
```

## Add in Mappings

```bash
#!env bash
aseqdump -p "Launchkey Mini MK3" |
  while IFS=" ," read src ev1 ev2 ch label1 data1 label2 data2 rest; do
    case "$ev1 $ev2 $data1" in
        "Note on 36")               echo wheel -1 | dotoolc ;;
        "Polyphonic aftertouch 40") echo wheel +1 | dotoolc ;;
        "Note on 40")               echo wheel +1 | dotoolc ;;
    esac
  done
```

## Run the Server and Your Script

```bash
dootoold &
bash midi-keys.sh
```
