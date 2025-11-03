### The Script to make an executable image

#### Usage:

```
 ./make-release-image.sh <fydeos raw image> <target runable image>
 <fydeos raw image>: the path to the bin image which was built by build_image
 <target runable image>: like <board>-<version>-<release version>.run
```

#### The generated .run file will:

- Support Rock 5B, Rock 5B Plus, and Rock 5T boards
- Auto-detect the correct board variant on first boot
- Support both NVME and EMMC boot storage
- Write board and storage magic markers to the image
- Install the appropriate bootloaders for the selected board
