package com.example.demo.core.utils;

public class TypeIdentifier {

	public boolean isInteger(Object obj) {
		return obj instanceof Integer;
	}

	public boolean isString(Object obj) {
		return obj instanceof String;
	}

	public boolean isDouble(Object obj) {
		return obj instanceof Double;
	}

	public int getInteger(Object obj) {
		return (Integer) (obj);
	}

	public String getString(Object obj) {
		return (String) (obj);
	}

	public Double getDouble(Object obj) {
		return (Double) (obj);
	}
}
