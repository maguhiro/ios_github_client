#
# ヘルプ
#
.PHONY: help
help:
	@ echo '■使い方'
	@ echo '  make setup              # セットアップ'
	@ echo '  make bundle             # bundle install'
	@ echo '  make carthage-boostrap  # carthage bootstrap'
	@ echo '  make carthage-update    # carthage update'
	@ echo '  make pod                # pod install'

#
# セットアップ
#
.PHONY: setup
setup: bundle pod carthage-bootstrap

#
# Bundler
#
.PHONY: bundle
bundle:
	bundle install

#
# Carthage
#
.PHONY: carthage-bootstrap
carthage-bootstrap:
	mint run carthage/carthage carthage bootstrap --platform ios --cache-builds

.PHONY: carthage-update
carthage-update:
	mint run carthage/carthage carthage update --platform ios --cache-builds

#
# CocoaPods
#
.PHONY: pod
pod:
	./bin/fastlane ios cocoapods_install
