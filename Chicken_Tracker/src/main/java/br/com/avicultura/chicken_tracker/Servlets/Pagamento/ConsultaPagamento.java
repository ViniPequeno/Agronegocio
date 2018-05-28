/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Pagamento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author vinic
 */
public class ConsultaPagamento {

    public static List<Pagamento> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Pagamento> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Pagamento p where p.estabelecimento.sufixoCNPJ =:estabelecimento"
                    + " ORDER BY ano DESC, mes DESC, dia DESC, valor DESC");
            query.setParameter("estabelecimento", estabelecimento);

            lista = query.getResultList();
            s.getTransaction().commit();
            return lista;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }

    public static String seteDiasDespesas(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 6; i >= 0; i--) {
                Query query = s.createQuery("from Pagamento p where  p.estabelecimento.id =:id and p.tipo = 'D'"
                        + " and p.dia =:dia and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i > 0) {
                    st += "!";
                }
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String trintaDiasDespesas(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 29; i >= 0; i--) {
                Query query = s.createQuery("from Pagamento p where  p.estabelecimento.id =:id and p.tipo = 'D'"
                        + " and p.dia =:dia and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i > 0) {
                    st += "!";
                }
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String dozeMesesDespesas(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i < 12; i++) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id and p.tipo = 'D'"
                        + " and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i < 11) {
                    st += "!";
                }
                gc.add(Calendar.MONTH, -1);
            }
        } catch (HibernateException e) {
            st = e.getMessage();
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String seteDiasGanhos(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 6; i >= 0; i--) {
                Query query = s.createQuery("from Pagamento p where  p.estabelecimento.id =:id and p.tipo = 'G'"
                        + " and p.dia =:dia and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i > 0) {
                    st += "!";
                }
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String trintaDiasGanhos(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 29; i >= 0; i--) {
                Query query = s.createQuery("from Pagamento p where  p.estabelecimento.id =:id and p.tipo = 'G'"
                        + " and p.dia =:dia and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i > 0) {
                    st += "!";
                }
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String dozeMesesGanhos(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i < 12; i++) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id and tipo = 'G'"
                        + " and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i < 11) {
                    st += "!";
                }
                gc.add(Calendar.MONTH, -1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String seteDiasLucros(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 6; i >= 0; i--) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id"
                        + " and p.dia =:dia and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i > 0) {
                    st += "!";
                }
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String trintaDiasLucros(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 29; i >= 0; i--) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id"
                        + " and p.dia =:dia and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("dia", gc.get(Calendar.DAY_OF_MONTH));
                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));

                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += gc.get(Calendar.DAY_OF_MONTH) + "/" + (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i > 0) {
                    st += "!";
                }
                gc.set(Calendar.DATE, gc.get(Calendar.DATE) - 1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
         */
        return st;
    }

    public static String dozeMesesLucros(Long estabelecimentoID) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        int dia, mes, ano;
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i < 12; i++) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id"
                        + " and p.mes =:mes and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("mes", gc.get(Calendar.MONTH) + 1);
                query.setParameter("ano", gc.get(Calendar.YEAR));
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += (gc.get(Calendar.MONTH) + 1) + "/"
                        + gc.get(Calendar.YEAR) + "/" + somario;
                if (i < 11) {
                    st += "!";
                }
                gc.add(Calendar.MONTH, -1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String AnosGanhos(Long estabelecimentoID, int tempo) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();

        tempo = gc.get(Calendar.YEAR) - tempo;
        List<Pagamento> lista = null;
        try {
            for (int i = 0; i <= tempo; i++) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id and tipo = 'G'"
                        + " and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);
                query.setParameter("ano", gc.get(Calendar.YEAR));
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.YEAR) + "/" + somario;
                if (i < tempo) {
                    st += "!";
                }
                gc.add(Calendar.YEAR, -1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String AnosDespesas(Long estabelecimentoID, int tempo) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();

        tempo = gc.get(Calendar.YEAR) - tempo;

        List<Pagamento> lista = null;
        try {
            for (int i = 0; i <= tempo; i++) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id and tipo = 'D'"
                        + " and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("ano", gc.get(Calendar.YEAR));
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    somario += p.getValor();
                }
                st += gc.get(Calendar.YEAR) + "/" + somario;
                if (i < tempo) {
                    st += "!";
                }
                gc.add(Calendar.YEAR, -1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }

    public static String AnosLucros(Long estabelecimentoID, int tempo) {
        String st = "";
        double somario = 0.0;
        Session s = HibernateFactory.getSessionFactory().openSession();
        GregorianCalendar gc = (GregorianCalendar) GregorianCalendar.getInstance();

        tempo = gc.get(Calendar.YEAR) - tempo;

        List<Pagamento> lista = null;
        try {
            for (int i = 0; i <= tempo; i++) {
                Query query = s.createQuery("from Pagamento p where p.estabelecimento.id =:id"
                        + " and p.ano =:ano");
                query.setParameter("id", estabelecimentoID);

                query.setParameter("ano", gc.get(Calendar.YEAR));
                lista = query.getResultList();
                somario = 0.0;
                for (Pagamento p : lista) {
                    if (p.getTipo() == 'D') {
                        somario -= p.getValor();
                    } else {
                        somario += p.getValor();
                    }
                }
                st += gc.get(Calendar.YEAR) + "/" + somario;
                if (i < tempo) {
                    st += "!";
                }
                gc.add(Calendar.YEAR, -1);
            }
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
         */
        return st;
    }
}
