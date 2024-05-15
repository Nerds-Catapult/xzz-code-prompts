use super::method::Method;

pub struct Request {
    path: String,
    query_string: Option<String>,
    method: Method
}