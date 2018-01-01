package service;

import java.util.*;
import repository.*;
import model.Transaction;
import model.TransactionDetails;

public class TransactionService {
	TransactionDAO tDAO;
	TransactionDetailsDAO tdDAO;

	public TransactionService() {
		tDAO = new TransactionDAOImpl();
		tdDAO = new TransactionDetailsDAOImpl();
	}

	public List<Transaction> findAllTrans() {
		return tDAO.findAllTrans();
	}

	public Transaction findTransByIndex(int index) {
		if (index >= 0 && index < getTransCount()) {
			return tDAO.findAllTrans().get(index);
		}
		return null;
	}

	public List<TransactionDetails> findTransDetails(Transaction t) {
		if (t == null)
			return null;
		return tdDAO.findTransDetails(t);
	}

	public int getTransCount() {
		return tDAO.findAllTrans().size();
	}

	public int getTransDetailCount(Transaction t) {
		return tdDAO.findTransDetails(t).size();
	}

	public int getLastTransId() {
		if (getTransCount() > 0) {
			return tDAO.findAllTrans().get(getTransCount() - 1).getTransactionId();
		}
		return 0;
	}

	public boolean createNewTransaction(Transaction transaction, List<TransactionDetails> transDetails) {

		if (!tDAO.addTrans(transaction, transDetails))
			return false;
		/*
		 * for (TransactionDetails td : transDetails) { if(!tdDAO.addTransDetails(td))
		 * return false; }
		 */
		return true;
	}

	public Transaction getLastTransaction() {
		if (getTransCount() > 0) {
			return findAllTrans().get(getTransCount() - 1);
		}
		return null;
	}
}
