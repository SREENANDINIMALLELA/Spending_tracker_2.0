require_relative('../db/sql_runner')

class TransactionService
  def self.getAllTransactions()
    return  Transaction.get_all_transactions()

  end

  def self.getTotalAmount(transactions)
    total_amount = 0
    transactions.each { |trans|
      (total_amount += trans.amount) }
      return  total_amount
    end
  end
