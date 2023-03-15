use std::env;
use std::process::Command;
use urlencoding::encode;

fn main() {
    // handle environment variables
    let browser = match env::var("BROWSER") {
        Ok(val) => val,
        Err(_e) => "".to_string(),
    };

    if browser.is_empty() {
        println!("Please Set $BROWSER Environment Variable");
        return;
    }

    // handle command line arguments
    let args: Vec<String> = env::args().collect();
    let query_string = &args[1..args.len()].join(" ");
    let query_string_encoded = encode(query_string);
    let github_search_url = format!("https://github.com/search?q={}", query_string_encoded);
    let _ = Command::new("open")
        .arg("-a")
        .arg(browser)
        .arg(github_search_url)
        .output();
}
