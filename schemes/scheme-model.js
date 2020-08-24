const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function add(scheme) {
    return db('schemes').insert(scheme, 'id')
};

function find() {
    return db('schemes');
};

function findById(id) {
    return db('schemes').where('id', id).first();
};

function findSteps(id) {
    return db('steps')
        .join('schemes', 'steps.scheme_id', 'schemes.id')
        .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .orderBy('step_number')
        .where('scheme_id', id)
    
};

function remove(id) {  
    return db('schemes')
        .where('schemes.id', id)
        .del()
        
};

function update(changes, id) {
    return db('schemes')
        .where({id})
        .update(changes)
};