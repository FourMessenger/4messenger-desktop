#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use webview2_browser::*;

fn main() {
    let mut webview = WebView::new("FourMessenger", "https://fourmessenger.github.io");
    webview.set_size(1200, 800);
    webview.run();
}
