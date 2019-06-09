# Overview

This repository is a collection of useful scripts that as of this writing I've largely pulled from other people's blogs and gists and wanted to maintain in a central location. 

The original motivation was to combine several smaller non-MP4 videos into a single MP4 video with chapter markers and no re-encoding. Other people had similar motivations and it was relatively straightforward to adapt their strategies.

# Tools Used

I looked at several tools and quickly found [ffmpeg](https://ffmpeg.org/) satisfied all my goals with a modest effort. These scripts were tested under macOS Mojave. 

## Installing FFMPEG

I used [Homebrew](https://brew.sh/) to install ffpeg. It has a significant number of dependencies so don't be alarmed at the sheer volume of additional libraries it includes.

```
brew install ffmpeg
```

In my case I had a link error and had to run the installer twice. Unfortunately I didn't capture the error but it doesn't appear to have been anything that got in the way of using ffmpeg.

# Lossless Conversion of M4V to MP4

The M4V videos in question were encoded in H264. M4V is just a container as is MP4. All I wanted to do was move the content from one container to another. First up was a [Lifehacker article on lossless conversion using ffmpeg](https://www.lifehacker.com.au/2015/11/the-correct-way-to-convert-a-video-from-one-container-format-to-another/). Ok that's great but I want to convert entire directories of smaller videos. All I did was stuff the flags from the first article into this script from [Stackexchange to process the entire directory](https://stackoverflow.com/questions/5784661/how-do-you-convert-an-entire-directory-with-ffmpeg). 

The resulting script is `m4v-to-mp4-lossless.sh`.

# Merging MP4 Files with Chapters

Again I was looking at several other tools only to find ffmpeg was up to the task with a glue script. The original script is from [palaniraja](https://gist.github.com/palaniraja) in [this gist](https://gist.github.com/palaniraja/d14ba9ac49019526e0774b28e2d71b16).

The script is fairly opinionated and takes no arguments:
- The name of the current directory becomes the name of the output file
- It looks for mp4 files in the current directory and subdirectories nested up to 2 levels deep

I only needed it to handle the current directory but oddly it didn't sort the files. Be sure that your files sort alphabetically in the order you want them in the merged output file. I also did some cosmetic refactoring to remove a tiny amount of copy / paste, and remove the "-meta" suffix from the output file. You can just view the version history.

The script name is the same as the original: `merge-mp4.sh`.

# Using the Scripts

- Install `ffmpeg`
- Add the shell scripts in this repository to your system path (or reference them fully-qualified)
- Open a Terminal prompt and set the current working directory to the directory with the video files you wish to merge
  - All scripts assume the current directory is the work directory
  - Insure the name of the current folder matches the output file you want for the merged video file
- If you want to convert all M4V files to MP4 run `m4v-to-mp4-lossless.sh`
- To merge all MP4 files into a single file with chapter marks run `merge-mp4.sh`
