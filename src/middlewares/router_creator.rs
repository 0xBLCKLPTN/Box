use actix_web::web;


async fn main_router(cfg: &mut web::ServiceConfig) {
    cfg.service(
        web::scope("/")
            .service(health)
            .service(web::scope("/my-box"))
    )
} 