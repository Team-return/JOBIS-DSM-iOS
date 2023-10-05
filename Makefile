generate:
	tuist fetch
	tuist generate

ci_generate:
	tuist fetch
	TUIST_CI=1 tuist generate

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

cache_clean:
	rm -rf ~/Library/Developer/Xcode/DerivedData/*

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

module:
	swift Scripts/GenerateModule.swift

dependency:
	swift Scripts/NewDependency.swift

init:
	swift Scripts/InitEnvironment.swift

signing:
	swift Scripts/CodeSigning.swift
