use std::net::SocketAddr;

use axum::routing::get;
use axum::{Json, Router};

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/", get(|| async { Json("{\"status\": \"OK\"}") }))
        .route("/ping", get(|| async { Json("{\"status\": \"OK\"}") }))
        .route("/heartbeat", get(|| async { Json("{\"status\": \"OK\"}") }))
        .route("/health", get(|| async { Json("{\"status\": \"OK\"}") }));
    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    println!("listening on {}", addr);
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
