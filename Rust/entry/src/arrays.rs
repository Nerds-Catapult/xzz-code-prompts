use std::mem;

pub fn run() {
    //same data type elements

    let prime_nums: [i32; 9] = [2, 3, 5, 7, 11, 13, 17, 19, 23];

    //let prime_nums2: [i32; 10] = [2,3,5,7,11,13,17,19,23,29];

    println!("{:?}", prime_nums);

    let mut prime_nums_mut: [i32; 9] = [2, 3, 5, 7, 11, 13, 17, 19, 23];

    //change, cant add values
    prime_nums_mut[2] = 29;

    //size is calculated by passing a reference of mutable primnums array
    println!("Mutable Array with a length of {} and uses {} bytes of memory", prime_nums_mut.len(), mem::size_of_val(&prime_nums_mut));

    //slice
    let slice: &[i32] = &prime_nums_mut[3..4];

    let empty_array: [u32; 0] = [];
    assert_eq!(&empty_array, &[]);

    for i in 0..prime_nums.len() + 1 {
        match prime_nums.get(i){
            some(val) => println!("{}: {}", i, val),
            None => println!("slow down, array has gone {} too far!", i);
        }
    }
    println!("Slices {:?}", slice);
}