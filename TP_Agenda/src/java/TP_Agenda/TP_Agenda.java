package TP_Agenda;


public class TP_Agenda {
  private String nome, email, telefone;
  private static int totalUsers;

  public TP_Agenda(String nome, String email, String telefone) {
    this.nome = nome;
    this.email = email;
    this.telefone = telefone;
    this.totalUsers ++;
  }

  public String getNome() {
    return nome;
  }

  public String getEmail() {
    return email;
  }

  public String getTelefone() {
    return telefone;
  }

  public static int getTotalUsers() {
    return totalUsers;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setTelefone(String telefone) {
    this.telefone = telefone;
  }
}