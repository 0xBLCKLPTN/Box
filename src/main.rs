use actix_web::{web, App, HttpServer, HttpResponse, get, post, Responder};


#[get("/")]
async fn health() -> impl Responder {
    HttpResponse::Ok().body("Hello World!")
}

#[get("my-box")]
async fn my_box() -> impl Responder {
    HttpResponse::Ok().body("My Box")
}

#[post("upload")]
async fn upload_file() -> impl Responder {
    HttpResponse::Ok().body("Uploaded!")
}

#[get("file-data")]
async fn file_data() -> impl Responder {
    HttpResponse::Ok().body("File data")
}


#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(health)
            .service(my_box)
            .service(upload_file)
            .service(file_data)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
