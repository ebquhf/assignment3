/*
 * generated by Xtext 2.25.0
 */
grammar InternalMath;

options {
	superClass=AbstractInternalAntlrParser;
}

@lexer::header {
package dk.sdu.mmmi.mdsd.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package dk.sdu.mmmi.mdsd.parser.antlr.internal;

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import dk.sdu.mmmi.mdsd.services.MathGrammarAccess;

}

@parser::members {

 	private MathGrammarAccess grammarAccess;

    public InternalMathParser(TokenStream input, MathGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }

    @Override
    protected String getFirstRuleName() {
    	return "MathExp";
   	}

   	@Override
   	protected MathGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}

}

@rulecatch {
    catch (RecognitionException re) {
        recover(input,re);
        appendSkippedTokens();
    }
}

// Entry rule entryRuleMathExp
entryRuleMathExp returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getMathExpRule()); }
	iv_ruleMathExp=ruleMathExp
	{ $current=$iv_ruleMathExp.current; }
	EOF;

// Rule MathExp
ruleMathExp returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			{
				newCompositeNode(grammarAccess.getMathExpAccess().getVariablesVarBindingParserRuleCall_0());
			}
			lv_variables_0_0=ruleVarBinding
			{
				if ($current==null) {
					$current = createModelElementForParent(grammarAccess.getMathExpRule());
				}
				add(
					$current,
					"variables",
					lv_variables_0_0,
					"dk.sdu.mmmi.mdsd.Math.VarBinding");
				afterParserOrEnumRuleCall();
			}
		)
	)*
;

// Entry rule entryRuleVarBinding
entryRuleVarBinding returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getVarBindingRule()); }
	iv_ruleVarBinding=ruleVarBinding
	{ $current=$iv_ruleVarBinding.current; }
	EOF;

// Rule VarBinding
ruleVarBinding returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='var'
		{
			newLeafNode(otherlv_0, grammarAccess.getVarBindingAccess().getVarKeyword_0());
		}
		(
			(
				lv_name_1_0=RULE_ID
				{
					newLeafNode(lv_name_1_0, grammarAccess.getVarBindingAccess().getNameIDTerminalRuleCall_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getVarBindingRule());
					}
					setWithLastConsumed(
						$current,
						"name",
						lv_name_1_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_2='='
		{
			newLeafNode(otherlv_2, grammarAccess.getVarBindingAccess().getEqualsSignKeyword_2());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getVarBindingAccess().getExpressionExpParserRuleCall_3_0());
				}
				lv_expression_3_0=ruleExp
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getVarBindingRule());
					}
					set(
						$current,
						"expression",
						lv_expression_3_0,
						"dk.sdu.mmmi.mdsd.Math.Exp");
					afterParserOrEnumRuleCall();
				}
			)
		)
	)
;

// Entry rule entryRuleExp
entryRuleExp returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getExpRule()); }
	iv_ruleExp=ruleExp
	{ $current=$iv_ruleExp.current; }
	EOF;

// Rule Exp
ruleExp returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getExpAccess().getFactorParserRuleCall_0());
		}
		this_Factor_0=ruleFactor
		{
			$current = $this_Factor_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				(
					(
						{
							$current = forceCreateModelElementAndSet(
								grammarAccess.getExpAccess().getPlusLeftAction_1_0_0_0(),
								$current);
						}
					)
					otherlv_2='+'
					{
						newLeafNode(otherlv_2, grammarAccess.getExpAccess().getPlusSignKeyword_1_0_0_1());
					}
				)
				    |
				(
					(
						{
							$current = forceCreateModelElementAndSet(
								grammarAccess.getExpAccess().getMinusLeftAction_1_0_1_0(),
								$current);
						}
					)
					otherlv_4='-'
					{
						newLeafNode(otherlv_4, grammarAccess.getExpAccess().getHyphenMinusKeyword_1_0_1_1());
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getExpAccess().getRightFactorParserRuleCall_1_1_0());
					}
					lv_right_5_0=ruleFactor
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getExpRule());
						}
						set(
							$current,
							"right",
							lv_right_5_0,
							"dk.sdu.mmmi.mdsd.Math.Factor");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)*
	)
;

// Entry rule entryRuleFactor
entryRuleFactor returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getFactorRule()); }
	iv_ruleFactor=ruleFactor
	{ $current=$iv_ruleFactor.current; }
	EOF;

// Rule Factor
ruleFactor returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getFactorAccess().getPrimaryParserRuleCall_0());
		}
		this_Primary_0=rulePrimary
		{
			$current = $this_Primary_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				(
					(
						{
							$current = forceCreateModelElementAndSet(
								grammarAccess.getFactorAccess().getMultLeftAction_1_0_0_0(),
								$current);
						}
					)
					otherlv_2='*'
					{
						newLeafNode(otherlv_2, grammarAccess.getFactorAccess().getAsteriskKeyword_1_0_0_1());
					}
				)
				    |
				(
					(
						{
							$current = forceCreateModelElementAndSet(
								grammarAccess.getFactorAccess().getDivLeftAction_1_0_1_0(),
								$current);
						}
					)
					otherlv_4='/'
					{
						newLeafNode(otherlv_4, grammarAccess.getFactorAccess().getSolidusKeyword_1_0_1_1());
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getFactorAccess().getRightPrimaryParserRuleCall_1_1_0());
					}
					lv_right_5_0=rulePrimary
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getFactorRule());
						}
						set(
							$current,
							"right",
							lv_right_5_0,
							"dk.sdu.mmmi.mdsd.Math.Primary");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)*
	)
;

// Entry rule entryRulePrimary
entryRulePrimary returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getPrimaryRule()); }
	iv_rulePrimary=rulePrimary
	{ $current=$iv_rulePrimary.current; }
	EOF;

// Rule Primary
rulePrimary returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			(
				{
					$current = forceCreateModelElement(
						grammarAccess.getPrimaryAccess().getMathNumberAction_0_0(),
						$current);
				}
			)
			(
				(
					lv_value_1_0=RULE_INT
					{
						newLeafNode(lv_value_1_0, grammarAccess.getPrimaryAccess().getValueINTTerminalRuleCall_0_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getPrimaryRule());
						}
						setWithLastConsumed(
							$current,
							"value",
							lv_value_1_0,
							"org.eclipse.xtext.common.Terminals.INT");
					}
				)
			)
		)
		    |
		(
			otherlv_2='('
			{
				newLeafNode(otherlv_2, grammarAccess.getPrimaryAccess().getLeftParenthesisKeyword_1_0());
			}
			{
				newCompositeNode(grammarAccess.getPrimaryAccess().getExpParserRuleCall_1_1());
			}
			this_Exp_3=ruleExp
			{
				$current = $this_Exp_3.current;
				afterParserOrEnumRuleCall();
			}
			otherlv_4=')'
			{
				newLeafNode(otherlv_4, grammarAccess.getPrimaryAccess().getRightParenthesisKeyword_1_2());
			}
		)
		    |
		{
			newCompositeNode(grammarAccess.getPrimaryAccess().getVariableUseParserRuleCall_2());
		}
		this_VariableUse_5=ruleVariableUse
		{
			$current = $this_VariableUse_5.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getPrimaryAccess().getLetBindingParserRuleCall_3());
		}
		this_LetBinding_6=ruleLetBinding
		{
			$current = $this_LetBinding_6.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRuleLetBinding
entryRuleLetBinding returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getLetBindingRule()); }
	iv_ruleLetBinding=ruleLetBinding
	{ $current=$iv_ruleLetBinding.current; }
	EOF;

// Rule LetBinding
ruleLetBinding returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='let'
		{
			newLeafNode(otherlv_0, grammarAccess.getLetBindingAccess().getLetKeyword_0());
		}
		(
			(
				lv_name_1_0=RULE_ID
				{
					newLeafNode(lv_name_1_0, grammarAccess.getLetBindingAccess().getNameIDTerminalRuleCall_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getLetBindingRule());
					}
					setWithLastConsumed(
						$current,
						"name",
						lv_name_1_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_2='='
		{
			newLeafNode(otherlv_2, grammarAccess.getLetBindingAccess().getEqualsSignKeyword_2());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getLetBindingAccess().getBindingExpParserRuleCall_3_0());
				}
				lv_binding_3_0=ruleExp
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getLetBindingRule());
					}
					set(
						$current,
						"binding",
						lv_binding_3_0,
						"dk.sdu.mmmi.mdsd.Math.Exp");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_4='in'
		{
			newLeafNode(otherlv_4, grammarAccess.getLetBindingAccess().getInKeyword_4());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getLetBindingAccess().getBodyExpParserRuleCall_5_0());
				}
				lv_body_5_0=ruleExp
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getLetBindingRule());
					}
					set(
						$current,
						"body",
						lv_body_5_0,
						"dk.sdu.mmmi.mdsd.Math.Exp");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_6='end'
		{
			newLeafNode(otherlv_6, grammarAccess.getLetBindingAccess().getEndKeyword_6());
		}
	)
;

// Entry rule entryRuleVariableUse
entryRuleVariableUse returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getVariableUseRule()); }
	iv_ruleVariableUse=ruleVariableUse
	{ $current=$iv_ruleVariableUse.current; }
	EOF;

// Rule VariableUse
ruleVariableUse returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			{
				if ($current==null) {
					$current = createModelElement(grammarAccess.getVariableUseRule());
				}
			}
			otherlv_0=RULE_ID
			{
				newLeafNode(otherlv_0, grammarAccess.getVariableUseAccess().getRefBindingCrossReference_0());
			}
		)
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
