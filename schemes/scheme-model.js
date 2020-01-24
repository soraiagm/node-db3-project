const db = require('../data/db-config.js');


module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find() {
   return db("schemes");
}

function findById(id) {
    return db('schemes') 
        .where({ id }) 
        .first(); 
}

function findSteps(id) {
    return db("schemes")
        .select('schemes.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .join('steps', 'steps.scheme_id', 'schemes.id')
        .where('schemes.id', id)
        .orderBy('steps.step_number')
        
}


// THIS ONE DIDN'T WORK //
// function add(scheme) {
//     return db('schemes')
//         .insert("scheme")
//         .then(([id]) => {
//             return findById(id);
//         })
// }

function add(scheme) {
    return db('schemes')
      .insert(scheme)
      .then(ids => {
        return getById(ids[0]);
      });
  }

function addStep() {

  }

function update(changes, id) {
    return db('schemes')
    .where({ id })
    .update(changes);
}

function remove(id) {
    return db('schemes')
    .where('id', id)
    .del();
}