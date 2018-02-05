# Calabash Android Test

## Installation

- Install `Ruby`
   - If you're using `Homebrew`, you can install via `brew install ruby@2.3`
- Install `calabash-android` - https://github.com/calabash/calabash-android
- Install `bundler` gem if you have not
- Run `bundle install` to install all required `gem`

## Test Calabash Locally

- Run `./gradlew assembleDebug` to generate an `apk`, the `apk` will be generated in `app/build/outputs/apk/`
- Run `calabash-android app/build/outputs/apk/app-debug.apk` to start calabash test

## Test in `AppCenter` directly (Real Device)

1. Firstly, go to [https://appcenter.ms](https://appcenter.ms) and login with your account
2. Click the `Add new` button at the top right corner to create a new app
3. Inside the created app, go to `Build` menu, then link the app with the project via one of the following VCS:
![image](docs/repos.png)
4. Once linked successfully, simply make a `git push` on your project source, `AppCenter` will automatically

   - Build the apk
   - Run UI test on selected devices
   - If UI tested successfully, deploy to `DeployGate`

   **Note**

   `git push` only triggers the `build` process on `AppCenter`. The `Test on UI` process is triggered by the `post-build` script file `app/appcenter-post-build.sh`

   ---

## Test in `AppCenter` via `CircleCI`

1. Refer to `.circleci/config.yml` for the running steps
2. Link and follow your project source in `CircleCI` console
- Simply make a `git push` to trigger the CI on `CircleCI`

## Test in `Bitrise` directly (Emulator)

- Firstly, create a new repository in your `Github` account
- Then you'll need to create a `Bitrise` account - https://www.bitrise.io/dashboard
- In your dashboard, click `Add new app`, it will guide you through the process
![image](docs/image1.png)
- You can follow the complete [instructions](http://devcenter.bitrise.io/adding-a-new-app/) here 
- In short, you will need to grant read access to your project repository to `Bitrise`, enable `Git Hook`, this will enable `Bitrise` to trigger build on Git events (eg.push, pull, etc)
- Once you are done, simply push a commit to your Github remote branch, you should see the build is triggered automatically in `Bitrise`

**Bitrise CLI (Optional)**
- Alternatively you can install [Bitrise CLI](https://www.bitrise.io/cli) to test locally on your computer before deploying

## Known Issues

- The latest `calabash-android` version is `0.9.2` and it is dependent on gem `json ~> 1.8.x`. Ruby with version `2.4.x` onwards will have `json` `v2.0` installed by default. As such, This will cause conflict with the one in `calabash-android`. This issue happens on both `CircleCI` and `Bitrise`
- Testing in `AppCenter` via `Bitrise` is possible, please refer to `bitrise.yml`. However, it may cause timeout on the `Free` plan due to build time limit
![image](docs/bitrise_timeout.png)