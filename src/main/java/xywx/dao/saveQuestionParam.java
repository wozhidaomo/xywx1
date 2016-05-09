package xywx.dao;

import java.util.List;

public class saveQuestionParam {

	List<Topicoption> topicoptions;
	Question question;
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<Topicoption> getTopicoptions() {
		return topicoptions;
	}

	public void setTopicoptions(List<Topicoption> topicoptions) {
		this.topicoptions = topicoptions;
	}
}
