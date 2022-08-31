# assets_access

An _**asset**_ is a file that is bundled and deployed with your app, and is accessible at runtime. Common types of assets include static data (for example, JSON files), configuration files, icons, and images.

In this study case, we have two loaded files from _**asset**_ directory. One to get strings and another to add a image to the page.

### Highlights:

- `Async` loading of asset files,
- configuration in `pubspec.yaml` to allow _**asset**_ directory access,
- content loaded after `json` data was completely loaded.

### Working example:

![example](../img/assets_access.png)