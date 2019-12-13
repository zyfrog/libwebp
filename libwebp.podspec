#
#  Be sure to run `pod spec lint libwebp.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "libwebp"
  spec.version      = "1.0.3"
  spec.summary      = "Library to encode and decode images in WebP format."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
    Library to encode and decode images in WebP format.
                   DESC

  spec.homepage     = "https://developers.google.com/speed/webp/"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = { :type => "BSD", :file => "COPYING" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  # spec.author             = { "Google Inc." => "" }
  spec.author    = "Google Inc."
  # spec.authors            = { "" => "" }
  # spec.social_media_url   = "https://twitter.com/"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  # spec.platform     = :ios, "5.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.8"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "http://gitlab.hellobike.cn/Torrent/libwebp.git", :tag => "v1.0.3" }

  spec.compiler_flags = "-D_THREAD_SAFE"
  spec.pod_target_xcconfig = { "USER_HEADER_SEARCH_PATHS" => "$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/"}
  spec.preserve_paths = "src"
  spec.default_subspecs = [
    "webp",
    "demux",
    "mux"
  ]
  spec.prepare_command = "sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'"
  spec.subspec 'webp' do |ss|
    ss.source_files = [
      "src/webp/decode.h",
      "src/webp/encode.h",
      "src/webp/types.h",
      "src/webp/mux_types.h",
      "src/webp/format_constants.h",
      "src/utils/*.{h,c}",
      "src/dsp/*.{h,c}",
      "src/dec/*.{h,c}",
      "src/enc/*.{h,c}"
    ]
    ss.public_header_files = [
      "src/webp/decode.h",
      "src/webp/encode.h",
      "src/webp/types.h",
      "src/webp/mux_types.h",
      "src/webp/format_constants.h"
    ]
  end

  spec.subspec 'demux' do |ss|
    ss.source_files = [
      "src/demux/*.{h,c}",
      "src/webp/demux.h"
    ]
    ss.public_header_files = [
      "src/webp/demux.h"
    ]
    ss.dependency 'libwebp/webp'
  end

  spec.subspec 'mux' do |ss|
    ss.source_files = [
      "src/mux/*.{h,c}",
      "src/webp/mux.h"
    ]
    ss.public_header_files = [
      'src/webp/mux.h'
  ]
    ss.dependency 'libwebp/demux'
  end


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = false

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
