package repository;

import java.util.List;

import model.Transaction;
import model.TransactionDetails;

public interface TransactionDetailsDAO {

	List<TransactionDetails> findTransDetails(Transaction t);

	boolean addTransDetails(TransactionDetails td);

	boolean editTransDetails(TransactionDetails td);

	boolean deleteTransDetails(TransactionDetails td);

}