pub fn run(){
    //immutable by default
    
    let company = "Google";

    //non mutable by default
    //let experience = 14;

    //mutable
    let mut experience = 12;

    experience = 14;


    println!("Hamano works at {}, for almost {} years\n", company, experience);

        //Define constants

    const ID:i32 = 001;
    println!("ID: {}", ID);

    //assign multiple vars
    let (my_company, my_exp) = ("Google", 14);

    println!("Junino has worked at {} for over {} years\n", my_company, my_exp);

    //shadowing
    let index_ = 0.0;

    let index_ = index_ + 1.0;

    {
        let index_ = index_ / 5.0;

        println!("Inner-scope Variable is {} (SHADOWING ENDED)\n", index_);
    }

    println!("Variable is {} (after SHADOWING ENDED)\n", index_);

}