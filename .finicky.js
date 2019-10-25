module.exports = {
    defaultBrowser: 'Safari',
    handlers: [
        {
            // Open links from some apps in Google Chrome Canary
            match: ({ sourceBundleIdentifier }) =>
                sourceBundleIdentifier === 'com.apple.mail' ||
                sourceBundleIdentifier === 'com.tinyspeck.slackmacgap' ||
                sourceBundleIdentifier === 'com.googlecode.iterm2',
            browser: 'Google Chrome Canary'
        }
    ]
};
