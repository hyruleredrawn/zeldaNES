/*
    Simple random attribute value selector
    -Tyson Moll 2022
*/

// Inputs
const val_options = [
    //"photo/mess_1.jpg",
    "photo/mess_2.jpg",
    //"photo/mess_3.jpg",
    //"photo/nes_1.jpg",
    "photo/nes_2.jpg",
    //"photo/nes_3.jpg",
    //"photo/snes_1.jpg",
    "photo/snes_2.jpg",
    //"photo/snes_3.jpg",
];
const el_id = "backdrop";
const attr_name = "src";

// Selection
var el = document.getElementById(el_id);
var attr_select = Math.round(Math.random() * (val_options.length - 1));
el.setAttribute(attr_name, val_options[attr_select]);