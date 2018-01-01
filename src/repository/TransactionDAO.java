package repository;

import java.util.List;

import model.Transaction;
import model.TransactionDetails;

public interface TransactionDAO {

	List<Transaction> findAllTrans();

	boolean addTrans(Transaction t, List<TransactionDetails> transDetails);

	boolean editTrans(Transaction t);

	boolean deleteTrans(Transaction t);

}