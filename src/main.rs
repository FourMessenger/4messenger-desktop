#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use webview_official::*;

fn main() {
    let mut webview = WebviewBuilder::new()
        .title("FourMessenger")
        .width(1200)
        .height(800)
        .resize(SizeHint::NONE)
        .debug(true)
        .url("https://fourmessenger.github.io")
        .build();

    webview.run();
}
