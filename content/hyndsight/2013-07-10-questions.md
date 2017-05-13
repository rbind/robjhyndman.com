---
author: robjhyndman
comments: true
date: 2013-07-10 21:58:55+00:00

link: https://robjhyndman.com/hyndsight/questions/
slug: questions
title: Asking good questions
wordpress_id: 2240
---

>I'm currently attending my third conference in three weeks. So I've heard a lot of talks, and I've heard a lot of questions asked after the talks. In this guest post, [Eran Raviv](http://eranraviv.com/) reflects on what makes a good question after a talk.

<!-- more -->

A few weeks back I attended the excellent [ISF conference](http://forecasters.org/isf/). In one of the sessions, the presenter was talking about a state-of-the-art method to prevent model overfitting, an issue with an ever-growing importance in this era of increased computational power and data storage capabilities. The presenter went a bit over the time-limit (which is roughly 15 minutes) so at the end of the presentation, the chair of the session allowed only one question. I had many questions running around my head and was hoping the single allowed question would coincide with one of my own. No, the question that finally went through resembled: “Why did you decide to use AIC and not the BIC criterion?”. In such a high-level talk, that question was a complete miss.

A typical conference has few parallel sessions running with three or four presenters per session. Each talk is about 15 minutes long which leaves about five minutes for questions. Perhaps because of this measly amount of time left for discussion, there is absolutely _zero training_ as to which questions are useful and which are not. My take is that _because_ those minutes are so few, there should be at least something somewhere written about it.

The thing is, most researchers are feedback-thirsty. They are also heavily invested in the conference, potentially travelling many hundreds (or thousands) of kilometers to attend. I am confident the “AIC or BIC?” type of questions is not what they aim for. Wrong questions are also annoying from the audience standpoint, who have chosen to sit in that particular session and not another session running in parallel.


### Bad practice: being inconsiderate

  1. <em>Although it looks like a class, it is not.</em> It might be that in your own work you struggle with similar choices: which information criterion to use, which number of lags, which bandwidth, and so forth. This is not a good forum for these sort of questions as it is too you-specific, too basic and is very boring for everyone else.

	
  2. _Prioritize._ We've all heard questions that start with “I have two questions and two short comments..”. Do not fool yourself to think you can “squeeze” it in. What is more likely to happen is that you will speak fast and be unclear, and the presenter will ask you to repeat what exactly it is that you ask. Moreover, perhaps your “two short comments” do not require a reply as far as you are concerned, but the presenter will (naturally) respond to those as well, consuming more valuable minutes. So, prioritize and pick one out of your “two questions and two short comments”.

	
  3. _It’s OK to disagree, but do it silently._ Perhaps the reply you got was not what you expected; there is no need to explain why the presenter is wrong and why your proposal is better. The need to defend your argument is solely your own, so skip variants of the form: “I still think my suggestion is better since...”. These kind of last words do not really serve anyone and can result in a dead-end back and forth between asker and presenter.

	
  4. _You are experienced, we understand._ Spare us the introduction: “A few years back I was working for company X, and there we had a similar situation to what you are describing, blah blah... but that’s a different story. So I guess my question is..”. Suffice yourself with the core version of the question and lose the wrapping.




### Good practice: be helpful





	
  1. _Methods._ Don’t ask about spectral analysis if you don’t know much about it, but it is good to ask if you are experienced with it and are familiar with specific implementation issues that you wonder about.

	
  2. _Intuition._ It is good to ask a question about presented results that you might expect to be reversed or that are not in-line with theory for example.  
  


Both of the above are also useful for the presenter as it helps her figure out which direction the questions come from, so that she can better clarify it in the actual text.



	
  3. _Make reasonable suggestions._ If the authors chose to use a factor model, don’t suggest a Bayesian VAR instead. The authors made their modeling choices and will not change them because you think another option is better. However, you can make a difference with a suggestion that does not require many hours of work. For example, if the study compares a few forecasting methods, you can suggest examining the performance of a simple average of those methods; or if someone uses LASSO, you can suggest Adaptive LASSO. Your goal here is to plant the idea and convince the presenter that it is doable and likely to improve the paper.

	
  4. _References are always nice._ People frequently approach someone who asked something during the session and request the reference cited. Literature is hard to completely cover.


Although written with conference sessions in mind, most of the above is relevant in general, and can be concisely summarized: be considerate and helpful.

As Paul R. Halmos wrote, “Do, please, as I say, and not as I do.” I too have trouble following my own advice, but awareness is always a solid first step. Feel free to add and comment from your own experience.
