use std::net::TcpListener;
use std::io::Read;

pub struct Server {
    address: String,
}


impl Server{
    pub fn new(address: String) -> Self {
        Self {
            address
        }
    }


    pub fn run(self) {
        println!("Server running on: {}", self.address);
        
        let listener = TcpListener::bind(&self.address).unwrap();

        loop {

            match listener.accept() {
                Ok((mut stream, _)) => {
                    let mut buffer = [0; 1024];
                    let _ = stream.read(&mut buffer);
                },

                Err(e) => println!("Error, Connection Failed: {}", e)
            }

        }

    }

}
