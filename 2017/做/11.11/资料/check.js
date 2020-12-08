"use strict";

const isSimilar = (v1, v2, d=1e-4) => Math.abs(v1 - v2) < d;

let fxs = [
    t => [t ** 2, t * 2, 2],
    t => [t * 3, 6 + (t ** (1 / 2)), 2],
    t => [9, t * 2, 2],
];

function Drone(f) {
    /**
     * @param f<Function>(time: Number) => Number[]
     * @return Drone<Drone>
     */
    if(f(0).length !== 3) {
        throw new TypeError("Invalid Function f: requires f<Function> => Number[]");
    }
    this.fx = f;
    this.changeTime = function (t) {
        let position = f(t);
        this.x = position[0];
        this.y = position[1];
        this.z = position[2];
        return position;
    };
    this.x = f(0)[0];
    this.y = f(0)[1];
    this.z = f(0)[2];
    this.currentTime = 0.0;
    this.next = function (padtime=1e-5) {
        this.currentTime += padtime;
        return this.getPosition(this.currentTime);
    };
    this.getPosition = function (t) {
        return this.fx(t);
    }
}

function check () {
    let drones = [];
    fxs.forEach(fx => {
        drones.push(new Drone(fx));
    });
    
    // Start flying
    for(let t = 0.0; t <= 120; t += 1) {
        let table = [];
        drones.forEach((drone, index) => {
            let [x, y, z] = drone.getPosition(t);
            //check
            for(let i = 0; i < table.length; i++) {
                let [tx, ty, tz] = table[i];
                if(isSimilar(tx, x) && isSimilar(ty, y) && isSimilar(tz, z)) {
                    throw new Error(`Crashed at [${[x,y,z]}]: fx${i} & fx${index}, t=${t}`);
                }
            }
            table.push([x, y, z]);
            console.log(table);
        });
    }
}
