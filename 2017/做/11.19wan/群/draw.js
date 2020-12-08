"use strict";

var ctx_xy = $("#xy").get(0).getContext('2d'); //Init
var ctx_xz = $("#xz").get(0).getContext('2d');
var ctx_yz = $("#yz").get(0).getContext('2d');

const OFFSET_2 = 460; //Preset

ctx_xy.fillStyle = "#fff";
ctx_xy.fillRect(0, 0, 450, OFFSET_2);
ctx_xz.fillStyle = "#fff";
ctx_xz.fillRect(0, 0, 450, OFFSET_2);
ctx_yz.fillStyle = "#fff";
ctx_yz.fillRect(0, 0, 450, OFFSET_2);

let table = [],
    crashed = {};

function draw (x, y, z, color, cluster, index) {
    let R = 4;
    for(var i = 0, l = table.length; i < l; i++) { //Check if Point[x y z] will crash with any existing points
        let point = table[i];
        let tx = point[0],
            ty = point[1],
            tz = point[2];
        if(willCrash(tx, ty, tz, x, y, z, index, i)) {
            var smaller = Math.min(index, i);
            var bigger = Math.max(index, i);
            if(smaller in crashed) {
                if(crashed[smaller].indexOf(bigger) === -1) {
                    crashed[smaller].push(bigger);
                }
            } else {
                crashed[smaller] = [bigger];
            }
            color = "#000";
            R = 5;
            console.log(index, i); //write optput
        }
    }
    table.push([x, y, z]); //add this point to the points set
	x *= 2;
	y *= 2;
	z *= 2;
    const OFFSET_1 = -1 && 150;
	ctx_xy.clearRect(x + OFFSET_1, OFFSET_2 - y - R, R, R);
	ctx_xy.fillStyle = color || "#fff";
    ctx_xy.fillRect(x + OFFSET_1, OFFSET_2 - y - R, R, R); //Draw point
    ctx_xy.font = "Consolas";
    ctx_xy.fillText(index, x + OFFSET_1, OFFSET_2 - y - R); //Write ID to Canvas

	ctx_xz.clearRect(x + OFFSET_1, OFFSET_2 - z - R, R, R);
	ctx_xz.fillStyle = color || "#fff";
	ctx_xz.fillRect(x + OFFSET_1, OFFSET_2 - z - R, R, R); //Draw point
    ctx_xz.font = "Consolas";
    ctx_xz.fillText(index, x + OFFSET_1, OFFSET_2 - z - R); //Write ID to Canvas

    ctx_yz.clearRect(y + OFFSET_1, OFFSET_2 - z - R, R, R);
	ctx_yz.fillStyle = color || "#fff";
	ctx_yz.fillRect(y + OFFSET_1, OFFSET_2 - z - R, R, R); //Draw point
    ctx_yz.font = "Consolas";
    ctx_yz.fillText(index, y + OFFSET_1, OFFSET_2 - z - R); //Write ID to Canvas
}

function round(num) { //this function will eliminate calculation tolerance
    let integer, decimal;
    if (num >= 0) {
        integer = Math.floor(num);
        decimal = num - integer;
    } else {
        integer = Math.ceil(num);
        decimal = num - integer;
    }
    decimal = Math.round(decimal * 1e12) / 1e12;
    return integer + decimal + 30;
}

function willCrash (tx, ty, tz, x, y, z, i1, i2) { //this function checks whether Point[tx ty tz] and Point[x y z] have a distance shorter than 1 (safety distance) or not, and warn when distance < 1 is found.
    const d = 1;
    let dist = Math.sqrt(
        Math.pow(tx - x, 2) + 
        Math.pow(ty - y, 2) + 
        Math.pow(tz - z, 2)
    );
    if(dist < d && Math.abs(dist - d) > 1e-13) {
        var smaller = Math.min(i1, i2);
        var bigger = Math.max(i1, i2);
        if(smaller in crashed) {
            if(crashed[smaller].indexOf(bigger) === -1) {
                console.warn(`might crash: ${dist} < ${d}`)
            }
        } else {
            console.warn(`might crash: ${dist} < ${d}`);
        }
        return true;
    }
    return false;
};
