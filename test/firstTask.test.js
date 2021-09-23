const assert = require('assert')
const ganache = require('ganache-cli')
const Web3 = require('web3')
const web3 = new Web3(ganache.provider())
const {interface, bytecode} = require('../compile')

let accounts
let firstTask

beforeEach(async () => {
    accounts = await web3.eth.getAccounts()

    firstTask = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({data: bytecode, arguments: []})
        .send({from: accounts[0], gas: '1000000'})
})

describe('Test operation of summation', () =>{
    it('deplous a contract', () => {
        assert.ok(firstTask.options.address)
    })

    it('\'3333311111117115\' + \'44422222221111\' = \'3377733333338226\'', () => {
        const a = '3333311111117115'
        const b = '44422222221111'
        const res = '3377733333338226'

        const resContract = await firstTask.methods.sum(a, b).send({from: accounts[0]})
        assert.equal(res, resContract)
    })

    it('\'7777555511111111\' + \'\'3332222222112\' = \'7780887733333223\'', () => {
        const a = '7777555511111111'
        const b = '3332222222112'
        const res = '7780887733333223'

        const resContract = await firstTask.methods.sum(a, b).send({from: accounts[0]})
        assert.equal(res, resContract)
    })


})
