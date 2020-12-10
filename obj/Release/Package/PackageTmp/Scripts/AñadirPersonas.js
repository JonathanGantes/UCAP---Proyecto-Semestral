//Realiza la funcion de que cuando se elige el sexo Femenino se Deslecciona el Sexo Masculino
function ValidaF() {
    CheckBox1 = document.getElementById("CheckBox1");
    CheckBox2 = document.getElementById("CheckBox2");

    if (CheckBox2.checked == true) {
        CheckBox1.checked = false;
    }
}

//Realiza la funcion de que cuando se elige el sexo Masculino se Deslecciona el Sexo Femenino
function ValidaM() {
    CheckBox1 = document.getElementById("CheckBox1");
    CheckBox2 = document.getElementById("CheckBox2");

    if (CheckBox1.checked == true) {
        CheckBox2.checked = false;
    }
}