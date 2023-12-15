import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController? webViewController;
  InAppWebViewSettings options = InAppWebViewSettings(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      javaScriptEnabled: true,
      useHybridComposition: true,
      allowsInlineMediaPlayback: true,
      // Setting this off for security. Off by default for SDK versions >= 16.
      allowFileAccessFromFileURLs: false,
      // Off by default, deprecated for SDK versions >= 30.
      allowUniversalAccessFromFileURLs: false,

      // Keeping these off is less critical but still a good idea, especially if your app is not
      // using file:// or content:// URLs.
      allowFileAccess: false,
      allowContentAccess: false,

      // Basic WebViewAssetLoader with custom domain
      webViewAssetLoader: WebViewAssetLoader(
          domain: "test.local.com",
          pathHandlers: [AssetsPathHandler(path: '/assets/')])
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri("https://test.local.com/assets/flutter_assets/assets/www/testapp/dist/spa/index.html")),
        initialSettings: options,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        }
      ),
    );
  }
}
